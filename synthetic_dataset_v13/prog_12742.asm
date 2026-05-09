; DESCRIPTION: Composite: Places a blue 115x33 rectangle at position (301, 92) then Places a red dot at position (123, 92).
; PLAN: r0=301(x), r1=92(y), r2=115(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=92(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 92
LDI r2, 115
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 92
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
