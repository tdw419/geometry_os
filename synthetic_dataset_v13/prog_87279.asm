; DESCRIPTION: Places a green 54x42 rectangle at position (446, 163).
; PLAN: r0=446(x), r1=163(y), r2=54(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 163
LDI r2, 54
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
