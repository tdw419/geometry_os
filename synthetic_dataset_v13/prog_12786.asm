; DESCRIPTION: Places a black 65x48 rectangle at position (271, 199).
; PLAN: r0=271(x), r1=199(y), r2=65(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 199
LDI r2, 65
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
