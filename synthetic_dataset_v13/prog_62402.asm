; DESCRIPTION: Renders a black box of size 28x53 starting at (387, 135).
; PLAN: r0=387(x), r1=135(y), r2=28(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 135
LDI r2, 28
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
