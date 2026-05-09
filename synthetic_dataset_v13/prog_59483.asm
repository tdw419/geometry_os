; DESCRIPTION: Composite: Places a black 95x120 rectangle at position (189, 70) then Places a cyan dot at position (445, 102).
; PLAN: r0=189(x), r1=70(y), r2=95(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=102(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 189
LDI r1, 70
LDI r2, 95
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 102
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
