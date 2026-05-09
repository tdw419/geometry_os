; DESCRIPTION: Renders a yellow box of size 107x90 starting at (146, 112).
; PLAN: r0=146(x), r1=112(y), r2=107(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 112
LDI r2, 107
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
