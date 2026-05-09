; DESCRIPTION: Renders a cyan box of size 45x44 starting at (352, 48).
; PLAN: r0=352(x), r1=48(y), r2=45(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 48
LDI r2, 45
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
