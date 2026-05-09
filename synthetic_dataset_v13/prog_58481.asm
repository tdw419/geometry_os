; DESCRIPTION: Places a black 65x105 rectangle at position (140, 146).
; PLAN: r0=140(x), r1=146(y), r2=65(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 146
LDI r2, 65
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
