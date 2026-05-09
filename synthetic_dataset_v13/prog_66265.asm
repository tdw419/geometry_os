; DESCRIPTION: Renders a cyan box of size 26x65 starting at (275, 178).
; PLAN: r0=275(x), r1=178(y), r2=26(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 178
LDI r2, 26
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
