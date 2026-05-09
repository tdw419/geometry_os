; DESCRIPTION: Composite: Places a cyan dot at position (224, 75) then Places a blue line segment connecting (280, 221) to (50, 72).
; PLAN: r0=224(x), r1=75(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=280(x1), r6=221(y1), r7=50(x2), r8=72(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 75
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 280
LDI r6, 221
LDI r7, 50
LDI r8, 72
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
