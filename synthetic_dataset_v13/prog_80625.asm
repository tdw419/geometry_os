; DESCRIPTION: Composite: Places a cyan line segment connecting (208, 201) to (482, 72) then Renders a red box of size 71x117 starting at (57, 125).
; PLAN: r0=208(x1), r1=201(y1), r2=482(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=57(x), r6=125(y), r7=71(width), r8=117(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 208
LDI r1, 201
LDI r2, 482
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 125
LDI r7, 71
LDI r8, 117
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
