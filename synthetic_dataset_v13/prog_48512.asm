; DESCRIPTION: Renders a green box of size 24x28 starting at (275, 143).
; PLAN: r0=275(x), r1=143(y), r2=24(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 143
LDI r2, 24
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
