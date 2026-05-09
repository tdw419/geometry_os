; DESCRIPTION: Renders a cyan box of size 89x56 starting at (290, 143).
; PLAN: r0=290(x), r1=143(y), r2=89(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 143
LDI r2, 89
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
