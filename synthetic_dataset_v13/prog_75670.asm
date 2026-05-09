; DESCRIPTION: Places a black 33x46 rectangle at position (239, 160).
; PLAN: r0=239(x), r1=160(y), r2=33(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 160
LDI r2, 33
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
