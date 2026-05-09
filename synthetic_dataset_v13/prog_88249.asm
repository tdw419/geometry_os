; DESCRIPTION: Renders a cyan box of size 73x57 starting at (420, 107).
; PLAN: r0=420(x), r1=107(y), r2=73(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 107
LDI r2, 73
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
