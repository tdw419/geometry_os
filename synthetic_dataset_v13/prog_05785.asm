; DESCRIPTION: Composite: Renders a white disk with center (358, 125) and radius 64 then Places a cyan 40x68 rectangle at position (82, 117).
; PLAN: r0=358(x), r1=125(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=82(x), r6=117(y), r7=40(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 125
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 82
LDI r6, 117
LDI r7, 40
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
