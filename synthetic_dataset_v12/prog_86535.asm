; DESCRIPTION: Renders a yellow box of size 37x120 starting at (150, 80).
; PLAN: r0=150(x), r1=80(y), r2=37(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 80
LDI r2, 37
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
