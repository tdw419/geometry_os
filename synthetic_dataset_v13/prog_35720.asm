; DESCRIPTION: Composite: Places a cyan dot at position (405, 198) then Creates a cyan rectangular region at (224, 70) spanning 99 by 75 pixels.
; PLAN: r0=405(x), r1=198(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=224(x), r6=70(y), r7=99(width), r8=75(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 198
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 224
LDI r6, 70
LDI r7, 99
LDI r8, 75
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
