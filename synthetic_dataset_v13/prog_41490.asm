; DESCRIPTION: Places a yellow 72x29 rectangle at position (332, 225).
; PLAN: r0=332(x), r1=225(y), r2=72(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 225
LDI r2, 72
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
