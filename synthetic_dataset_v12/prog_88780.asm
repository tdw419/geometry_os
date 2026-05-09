; DESCRIPTION: Renders a black box of size 45x86 starting at (313, 152).
; PLAN: r0=313(x), r1=152(y), r2=45(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 152
LDI r2, 45
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
