; mixed program
; initialization
  LDI r6, 3805
  LDI r15, 2
  LDI r13, 4
  IKEY r13
  CMPI r13, 0xB6EB68
  JNZ r13, key_0
  IKEY r1
  CMPI r1, 128
  JNZ r1, key_1
  LDI r6, 8
loop_2:
  ANDI r0, r13, 0x4F97F5
  CMPI r9, r13, 165
  LDI r8, 772
  LDI r1, 0x3E9457
  LDI r13, 977
  WPIXEL
  ADDI r6, r15, 0x2AEF21
  LDI r8, 1
  SUB r6, r6, r8
  JNZ r6, loop_2
  SAR r11, r10, r1
  SHL r10, r7, r14
  SHR r2, r21, r5
  SHR r8, r7, r14
  CALL func_3
func_3:
  SUB r13, r10, r0
  MUL r10, r9, r14
  RET
  PUSH r15
  MUL r11, r10, r12
  OR r10, r11, r2
  SUB r17, r8, r3
  AND r0, r14, r5
  ADD r4, r0, r3
  POP r15
  LDI r11, 255
  FILL r11
main_4:
  CMP r22, r1
  LDI r1, 1058
  LDI r0, 0x4A0AF9
  LDI r0, 10
  DRAWTEXT r1, r0, r0, "WORLD"
  FRAME
  JMP main_4
