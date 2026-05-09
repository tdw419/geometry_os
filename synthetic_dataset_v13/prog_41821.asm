; DESCRIPTION: Composite: Places a red dot at position (350, 141) then Creates a orange rectangular region at (135, 120) spanning 70 by 87 pixels.
; PLAN: r0=350(x), r1=141(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=135(x), r6=120(y), r7=70(width), r8=87(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 141
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 135
LDI r6, 120
LDI r7, 70
LDI r8, 87
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
