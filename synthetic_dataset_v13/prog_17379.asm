; DESCRIPTION: Renders a green box of size 104x40 starting at (368, 120).
; PLAN: r0=368(x), r1=120(y), r2=104(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 120
LDI r2, 104
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
