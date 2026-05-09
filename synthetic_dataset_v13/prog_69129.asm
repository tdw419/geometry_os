; DESCRIPTION: Renders a cyan box of size 48x77 starting at (391, 44).
; PLAN: r0=391(x), r1=44(y), r2=48(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 44
LDI r2, 48
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
