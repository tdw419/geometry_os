; DESCRIPTION: Composite: Places a cyan line segment connecting (4, 228) to (509, 58) then Places a blue 48x69 rectangle at position (395, 40).
; PLAN: r0=4(x1), r1=228(y1), r2=509(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=40(y), r7=48(width), r8=69(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 228
LDI r2, 509
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 40
LDI r7, 48
LDI r8, 69
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
