; DESCRIPTION: Places a green 107x46 rectangle at position (341, 152).
; PLAN: r0=341(x), r1=152(y), r2=107(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 152
LDI r2, 107
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
