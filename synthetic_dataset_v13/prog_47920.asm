; DESCRIPTION: Places a black 27x65 rectangle at position (234, 181).
; PLAN: r0=234(x), r1=181(y), r2=27(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 181
LDI r2, 27
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
