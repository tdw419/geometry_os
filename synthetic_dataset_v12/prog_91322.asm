; DESCRIPTION: Renders a cyan box of size 79x66 starting at (404, 107).
; PLAN: r0=404(x), r1=107(y), r2=79(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 107
LDI r2, 79
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
