; DESCRIPTION: Renders a cyan box of size 104x60 starting at (130, 164).
; PLAN: r0=130(x), r1=164(y), r2=104(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 164
LDI r2, 104
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
