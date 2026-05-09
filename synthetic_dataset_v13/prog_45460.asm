; DESCRIPTION: Composite: Places a purple 40x70 rectangle at position (238, 150) then Renders a white line between points (238, 53) and (449, 16).
; PLAN: r0=238(x), r1=150(y), r2=40(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x1), r6=53(y1), r7=449(x2), r8=16(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 150
LDI r2, 40
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 53
LDI r7, 449
LDI r8, 16
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
