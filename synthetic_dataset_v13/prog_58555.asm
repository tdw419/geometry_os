; DESCRIPTION: Renders a yellow box of size 73x64 starting at (415, 25).
; PLAN: r0=415(x), r1=25(y), r2=73(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 25
LDI r2, 73
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
