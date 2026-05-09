; DESCRIPTION: Places a black 39x11 rectangle at position (330, 169).
; PLAN: r0=330(x), r1=169(y), r2=39(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 169
LDI r2, 39
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
