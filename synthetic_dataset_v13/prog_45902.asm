; DESCRIPTION: Composite: Places a cyan 27x113 rectangle at position (152, 140) then Places a cyan dot at position (248, 88).
; PLAN: r0=152(x), r1=140(y), r2=27(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=88(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 152
LDI r1, 140
LDI r2, 27
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 88
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
