; DESCRIPTION: Renders a green box of size 117x21 starting at (48, 120).
; PLAN: r0=48(x), r1=120(y), r2=117(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 120
LDI r2, 117
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
