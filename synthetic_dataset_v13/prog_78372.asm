; DESCRIPTION: Renders a yellow box of size 107x32 starting at (92, 177).
; PLAN: r0=92(x), r1=177(y), r2=107(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 177
LDI r2, 107
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
