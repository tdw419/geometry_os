; DESCRIPTION: Renders a green box of size 21x120 starting at (448, 103).
; PLAN: r0=448(x), r1=103(y), r2=21(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 103
LDI r2, 21
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
