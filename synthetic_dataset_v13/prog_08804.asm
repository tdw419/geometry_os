; DESCRIPTION: Renders a cyan box of size 90x57 starting at (263, 119).
; PLAN: r0=263(x), r1=119(y), r2=90(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 119
LDI r2, 90
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
