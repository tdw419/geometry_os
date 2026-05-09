; DESCRIPTION: Renders a yellow box of size 107x10 starting at (210, 186).
; PLAN: r0=210(x), r1=186(y), r2=107(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 186
LDI r2, 107
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
