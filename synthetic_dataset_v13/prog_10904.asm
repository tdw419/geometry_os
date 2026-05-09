; DESCRIPTION: Composite: Places a red 97x120 rectangle at position (174, 1) then Places a magenta dot at position (401, 33).
; PLAN: r0=174(x), r1=1(y), r2=97(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=33(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 174
LDI r1, 1
LDI r2, 97
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 33
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
