; DESCRIPTION: Composite: Places a white 18x61 rectangle at position (51, 21) then Places a yellow line segment connecting (245, 226) to (394, 107).
; PLAN: r0=51(x), r1=21(y), r2=18(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x1), r6=226(y1), r7=394(x2), r8=107(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 21
LDI r2, 18
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 226
LDI r7, 394
LDI r8, 107
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
