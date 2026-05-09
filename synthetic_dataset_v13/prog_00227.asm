; DESCRIPTION: Composite: Draws a black line from (425, 223) to (471, 120) then Places a green 42x47 rectangle at position (50, 39).
; PLAN: r0=425(x1), r1=223(y1), r2=471(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=39(y), r7=42(width), r8=47(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 223
LDI r2, 471
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 39
LDI r7, 42
LDI r8, 47
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
