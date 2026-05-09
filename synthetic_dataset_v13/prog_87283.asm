; DESCRIPTION: Composite: Places a cyan 55x53 rectangle at position (142, 106) then Renders a magenta line between points (12, 173) and (289, 220).
; PLAN: r0=142(x), r1=106(y), r2=55(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x1), r6=173(y1), r7=289(x2), r8=220(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 106
LDI r2, 55
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 173
LDI r7, 289
LDI r8, 220
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
