; DESCRIPTION: Composite: Draws a white line from (140, 215) to (221, 38) then Places a white 20x20 rectangle at position (82, 117).
; PLAN: r0=140(x1), r1=215(y1), r2=221(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=117(y), r7=20(width), r8=20(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 215
LDI r2, 221
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 117
LDI r7, 20
LDI r8, 20
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
