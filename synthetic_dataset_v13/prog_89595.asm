; DESCRIPTION: Places a green 27x87 rectangle at position (40, 120).
; PLAN: r0=40(x), r1=120(y), r2=27(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 120
LDI r2, 27
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
