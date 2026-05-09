; DESCRIPTION: Composite: Places a magenta dot at position (141, 247) then Places a cyan 72x17 rectangle at position (185, 161).
; PLAN: r0=141(x), r1=247(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=185(x), r6=161(y), r7=72(width), r8=17(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 247
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 185
LDI r6, 161
LDI r7, 72
LDI r8, 17
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
