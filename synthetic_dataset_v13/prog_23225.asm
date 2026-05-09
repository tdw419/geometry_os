; DESCRIPTION: Renders a cyan box of size 47x27 starting at (174, 212).
; PLAN: r0=174(x), r1=212(y), r2=47(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 212
LDI r2, 47
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
