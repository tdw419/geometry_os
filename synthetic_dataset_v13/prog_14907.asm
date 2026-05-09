; DESCRIPTION: Renders a cyan box of size 47x77 starting at (245, 26).
; PLAN: r0=245(x), r1=26(y), r2=47(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 26
LDI r2, 47
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
