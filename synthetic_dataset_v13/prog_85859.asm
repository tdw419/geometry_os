; DESCRIPTION: Renders a yellow box of size 47x53 starting at (305, 96).
; PLAN: r0=305(x), r1=96(y), r2=47(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 96
LDI r2, 47
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
