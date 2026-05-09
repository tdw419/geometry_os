; DESCRIPTION: Renders a yellow box of size 59x32 starting at (66, 174).
; PLAN: r0=66(x), r1=174(y), r2=59(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 174
LDI r2, 59
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
