; DESCRIPTION: Renders a black box of size 48x28 starting at (305, 113).
; PLAN: r0=305(x), r1=113(y), r2=48(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 113
LDI r2, 48
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
