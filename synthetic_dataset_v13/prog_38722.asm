; DESCRIPTION: Renders a green box of size 71x64 starting at (298, 174).
; PLAN: r0=298(x), r1=174(y), r2=71(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 174
LDI r2, 71
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
