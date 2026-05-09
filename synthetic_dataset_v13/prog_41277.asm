; DESCRIPTION: Renders a cyan box of size 37x77 starting at (279, 71).
; PLAN: r0=279(x), r1=71(y), r2=37(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 71
LDI r2, 37
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
