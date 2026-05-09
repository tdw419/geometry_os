; DESCRIPTION: Renders a cyan box of size 98x46 starting at (193, 44).
; PLAN: r0=193(x), r1=44(y), r2=98(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 44
LDI r2, 98
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
