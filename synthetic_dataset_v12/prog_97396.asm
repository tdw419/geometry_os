; DESCRIPTION: Composite: Places a yellow 110x113 rectangle at position (265, 103) then Places a green dot at position (444, 142).
; PLAN: r0=265(x), r1=103(y), r2=110(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x), r6=142(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 265
LDI r1, 103
LDI r2, 110
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 142
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
