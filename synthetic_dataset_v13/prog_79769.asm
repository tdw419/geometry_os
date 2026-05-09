; DESCRIPTION: Places a green 21x63 rectangle at position (446, 37).
; PLAN: r0=446(x), r1=37(y), r2=21(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 37
LDI r2, 21
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
