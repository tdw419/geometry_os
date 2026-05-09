; DESCRIPTION: Composite: Sets a single white pixel at (253, 152) then Renders a white box of size 119x48 starting at (317, 117).
; PLAN: r0=253(x), r1=152(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=117(y), r7=119(width), r8=48(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 152
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 317
LDI r6, 117
LDI r7, 119
LDI r8, 48
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
