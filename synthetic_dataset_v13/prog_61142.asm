; DESCRIPTION: Composite: Places a cyan dot at position (48, 134) then Creates a cyan rectangular region at (28, 59) spanning 51 by 59 pixels.
; PLAN: r0=48(x), r1=134(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=28(x), r6=59(y), r7=51(width), r8=59(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 134
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 28
LDI r6, 59
LDI r7, 51
LDI r8, 59
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
