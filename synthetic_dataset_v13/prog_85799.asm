; DESCRIPTION: Composite: Sets a single red pixel at (51, 103) then Renders a cyan box of size 57x23 starting at (275, 215).
; PLAN: r0=51(x), r1=103(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=275(x), r6=215(y), r7=57(width), r8=23(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 103
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 275
LDI r6, 215
LDI r7, 57
LDI r8, 23
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
